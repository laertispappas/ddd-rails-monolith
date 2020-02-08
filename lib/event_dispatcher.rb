# frozen_string_literal: true

module EventDispatcher
  def self.emit(event)
    dispatchers.each { |dispatchers| dispatchers.dispatch(event) }
  end

  def self.included(base)
    dispatchers << base

    base.extend(ClassMethods)
  end

  def self.dispatchers
    @dispatchers ||= Set.new
  end

  module ClassMethods
    def on(*events, sync: [])
      registry.register(events: events.flatten, sync: Array(sync))
    end

    def dispatch(event)
      handlers = registry.for(event)
      handlers.sync.each { |handler| handler.call(event) }
    end

    private def registry
      @registry ||= Registry.new
    end
  end

  class Registry
    attr_reader :rules

    def initialize
      @rules = Hash.new { |h, k| h[k] = HandlerSet.new }
    end

    def register(events:, sync:)
      events.each do |event|
        @rules[event].add_sync sync
      end
    end

    def for(event)
      handlers = HandlerSet.new

      @rules.each do |event_class, rule|
        handlers.add_sync rule.sync if event.is_a?(event_class)
      end

      handlers
    end
  end

  class HandlerSet
    attr_reader :sync

    def initialize
      @sync = Set.new
    end

    def add_sync(handlers)
      @sync += handlers
    end
  end
end

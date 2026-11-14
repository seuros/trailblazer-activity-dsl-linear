module Trailblazer
  class Activity
    module DSL
      # FIXME: we should move the Step logic here, it's much more intuitive.
      class Normalizer
        # {:context_implementation} is needed for Node::Scoped.
        CIRCUIT_OPTIONS = {runner: Circuit::Node::Runner, context_implementation: Circuit::Context}.freeze

        def self.call(normalizer, name, **options)
          lib_ctx, _ = Circuit::Processor.(normalizer, options, {}, nil, CIRCUIT_OPTIONS)

          return lib_ctx[:adds_for_sequence]
        end
      end
    end
  end
end

# encoding: ascii-8bit

module BitcoinOld
  module Protocol
    # TxWitness section of https://en.bitcoin.it/wiki/Protocol_documentation#tx
    class ScriptWitness
      # witness stack
      attr_reader :stack

      def initialize
        @stack = []
      end

      # check empty
      def empty?
        stack.empty?
      end

      # output script in raw binary format
      def to_payload
        payload = BitcoinOld::Protocol.pack_var_int(stack.size)
        payload << stack.map { |e| BitcoinOld::Protocol.pack_var_int(e.bytesize) << e }.join
      end
    end
  end
end

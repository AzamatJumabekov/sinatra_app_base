module LogHelper
  def tag_logger(*tags)
    @tag_logger ||= TaggedLogger.new(tags)
  end

  def log(type, text)
    @tag_logger.log(type, text)
  end

  class TaggedLogger
    def initialize(tags)
      @tags = tags
    end

    def logger
      @logger ||= Logger.new(App.config.logger_output)
    end

    def log(type, text)
      log_text = prepared_text(@tags, text)
      logger.public_send(type, log_text)
    end

    private

    def prepared_text(tags, text)
      ''.tap do |s|
        tags.each do |t|
          s << ("[#{t}]" + ' ')
          s << text if tags.last == t
        end
      end
    end
  end
end

class TextsWorker

	@queue = :check_for_texts

	def self.perform
		texts_to_send = Moment.get_to_send
			TextsSender.new(texts_to_send).send
	end

end
class RdsConfiguration 
	include ActiveModel::Model
	attr_accessor :rds_name, :rds_text, :rds_alt_freqs, :rds_tr_program, :rds_tr_alert, :rds_music_speech, :rds_prog_id, :rds_prog_type
	def load
		@rds_name = Flexgem::Rds.read_rds_name
		@rds_text = Flexgem::Rds.read_rds_text
		@rds_alt_freqs = Flexgem::Rds.read_rds_alt_freqs
		@rds_tr_program = Flexgem::Rds.read_rds_tr_program
		@rds_tr_alert = Flexgem::Rds.read_rds_tr_alert
		@rds_music_speech  = Flexgem::Rds.read_rds_music_speech
		@rds_prog_id = Flexgem::Rds.read_rds_prog_id
		@rds_prog_type = Flexgem::Rds.read_rds_prog_type
	end
	
	def save
		 Flexgem::Rds.write_rds_name @rds_name
		 Flexgem::Rds.write_rds_text @rds_text
		 Flexgem::Rds.write_rds_alt_freqs @rds_alt_freqs
		 Flexgem::Rds.write_rds_tr_program @rds_tr_program
		 Flexgem::Rds.write_rds_tr_alert @rds_tr_alert
		 Flexgem::Rds.write_rds_music_speech @rds_music_speech
		 Flexgem::Rds.write_rds_prog_id @rds_prog_id
		 Flexgem::Rds.write_rds_prog_type @rds_prog_type
	end
	
end

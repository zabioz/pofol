class CandidatesController < ApplicationController
        def character_info
          @candidates = Candidate.all
        end

        def result
          @candidates = Candidate.all
        end  
        def index
              @candidates = Candidate.all
        end
        
        def upload
            uploaded_io = params[:person][:picture]
            File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
              file.write(uploaded_io.read)
            end
          end
                  
        def new
          @candidate = Candidate.new
        end
        
        def picture
          @candidate = Candidate.find_by(id: params[:id])
          @candidate.pictures.create(picture: request.remote_ip) if @candidate

          redirect_to candidates_path, notice: "success"
        end        

        def vote
          @candidate = Candidate.find_by(id: params[:id])
          @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
          redirect_to candidates_path, notice: "success"
        end
        def create
          @candidate = Candidate.new(candidate_params)
    
          if @candidate.save
          
            redirect_to candidates_path, notice: "success"
          else
                      render :new
          end
        end
        private
      def candidate_params
        params.require(:candidate).permit(:name)
      end
      def find_candidate
          @candidate = Candidate.find_by(id: params[:id])
        end
  end

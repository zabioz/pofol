class CandidatesController < ApplicationController
        def character_info
          @pictures = Picture.all
        end
      
        def result
          @candidates = Candidate.all
        end  
        def index
              @candidates = Candidate.all
              @pictures = Picture.all
        end
         
        def new
          @candidate = Candidate.new
        end

        def c_new
          @picture = Picture.new
        end
         
        def vote
          @candidate = Candidate.find_by(id: params[:id])
          @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
          redirect_to candidates_path, notice: "success"
        end
        def create
        @picture = Picture.new(picture_params)
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
      def picture_params
        params.require(:picture).permit(:image)
      end
      def find_candidate
          @candidate = Candidate.find_by(id: params[:id])
        end

  end

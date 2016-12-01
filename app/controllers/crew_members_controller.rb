class CrewMembersController < ApplicationController
  def new
    @crew_member = CrewMember.new
    @starship = @crew_member.build_starship
    @holodeck_programs = @starship.holodeck_programs.build
  end

  def create

    @crew_member = CrewMember.new(crew_member_params)


    respond_to do |format|
      if @crew_member.save
        @starship = @crew_member.starship
        holodeck = params[:crew_member][:starship_attributes][:holodeck_programs_attributes].values

        unless holodeck[0][:title].blank?
          @crew_member.starship.holodeck_programs.build(title: holodeck[0][:title],
                                                      starship_id: @starship.id, crew_member_id: @crew_member.id )
          @crew_member.save
        end

        format.html { redirect_to @starship,
          notice: 'Crew Member was successfully creared.'}
        format.json { render :show, status: :created, location: @starship}
      else
        format.html {
          @starship = @crew_member.build_starship
          @holodeck_programs = @starship.holodeck_programs.build
          render :new }
        format.json { render :json => @crew_member.errors, status: :unprocessable_entity}
      end
    end
  end



private
=begin
  def crew_member_params
    params.require(:crew_member).permit(:name,:division,:starship_id,
    starship_attributes: [:name,:id,
      holodeck_programs_attributes: [:title,:starship_id,:crew_member_id]])
  end
=end

  def crew_member_params
    params.require(:crew_member).permit(:name,:division,:bio,:starship_id,
              starship_attributes: [:name,:id])
  end
end
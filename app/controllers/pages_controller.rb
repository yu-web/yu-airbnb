class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
  end
  def search
    #stepl/assign session here
   if params[:search].present?
    #create session
    session[:loc_search] = params[:search]
   end

    #step2
   if session[:loc_search]
    #Grab all cities and nearby cities
    @rooms_address = Room.where(active: true).near(session[:loc_search],5,order: 'distance')
   else
    #grab all places here.
    @rooms_address = Room.where(active: true).all
   end
    #step3 forb ransck usage
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result
    @arrayRooms = @rooms.to_a

    #step4 -for checking date availability
   if(!params[:start_date].empty? && !params[:start_date].empty?)
    @start_date = Date.parse(params[:strat_date])
    @end_date = Date.parse(params[:end_date])
    @rooms.each do |room|
        taken_room = room.reservation.where("(? <= start_date AND start_date <= ?) OR(? <= end_date AND end_date <= ?)"),
        @start_date,@end_date,
        @start_date,@end_date.limit(1)

        if taken_room.any?
          @arrayRooms.delete(room)
        end
    end
  end
end
end

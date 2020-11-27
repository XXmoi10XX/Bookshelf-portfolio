class Admin::MembersController < Admin::Base

  def index
    @members = Member.order("number")
      .page(params[:page]).per(15)

      render "index"
  end

  def search
    @members = Member.search(params[:q])
      .page(params[:page]).per(15)


    render "index"
  end

  def show
    @member = Member.find(params[:id])
  end

end

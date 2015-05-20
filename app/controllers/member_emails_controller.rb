class MemberEmailsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_member_email, only: [:show, :edit, :update, :destroy]
  before_filter :privileges
  respond_to :html

  def index
    @member_emails = MemberEmail.all
    respond_with(@member_emails)
  end

  def show
    respond_with(@member_email)
  end

  def new
    @member_email = MemberEmail.new
    respond_with(@member_email)
  end

  def edit
  end
  def create
    @member_email = MemberEmail.new(params[:member_email])
    @member_email.save
    respond_with(@member_email)
  end

  def update
    @member_email.update_attributes(params[:member_email])
    respond_with(@member_email)
  end

  def destroy
    @member_email.destroy
    respond_with(@member_email)
  end

  def destroy_all
    MemberEmail.delete_all
    redirect_to member_emails_path
  end
  
  def batch_insert
  end

  def insert_all
      array_of_emails=params[:email][:emails].split(',')
      array_of_emails.each do |email|
        if not email.blank?
          MemberEmail.create(email: email)
        end
      end
      redirect_to member_emails_path
  end

  private
    def set_member_email
      @member_email = MemberEmail.find(params[:id])
    end
end

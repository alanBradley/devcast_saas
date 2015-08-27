class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)

	if @contact.save
		
		# message sending variable details pulled from private and stored in new variable names
		name = params[:contact][:name]
		email = params[:contact][:email]
		body = params[:contact][:comments]

		# runs the contact_email method in the ContactMailer Class, parameters set above, .deliver is special method to send
		ContactMailer.contact_email(name, email, body).deliver

		flash[:success] = 'Message sent.'
		redirect_to new_contact_path
	else
		flash[:danger] = 'Error occured, message has not been sent.'
		redirect_to new_contact_path
	end
  end

  private
	  def contact_params
	  	params.require(:contact).permit(:name, :email, :comments, :stripe_card_token)
	  end


end
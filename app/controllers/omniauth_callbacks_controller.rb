class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def twitter
		@user = User.from_omniauth(request.env["omniauth.auth"])

		if @user.persisted?
			flash.notice = "ログインしました！"
			sign_in_and_redirect @user
		else
			logger.debug(session)
			session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
			redirect_to root_url
		end
	end
end

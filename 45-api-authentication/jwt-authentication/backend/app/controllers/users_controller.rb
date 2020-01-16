class UsersController < ApplicationController

    def get_user
        user = User.find_by(name: params[:name])
        render( json: user, include: [ tickets: {
            include: [ :airline ]
        } ] )
    end

    def login
        user = User.find_by(username: params[:username])
        if(user.authenticate(params[:password]))
            token = JWT.encode( { id: user.id }, 'YOUR SECRET')
            render( json: { user: user, token: token }, include: [ tickets: {
                include: [ :airline ]
            } ] )
        else
            render( json: { failed: true, message: 'Login Failed'}) 
        end
    end


end
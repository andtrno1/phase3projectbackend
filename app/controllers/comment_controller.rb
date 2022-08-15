class CommentController < ApplicationController 

      get "/comments" do
        Comment.all.to_json
      end
    
      post "/comments" do
        createcomments = Comment.create(
          comment: params[:comments]
        )
        createcomments.to_json
      end
     
      put '/comments/:id' do
        update = Comment.update(params[:comments])
        update.to_json
      end

      delete "/comments/:id" do
        comment = Comment.find(params[:id])
        comment.destroy
        comment.to_json
      
      end


  
end

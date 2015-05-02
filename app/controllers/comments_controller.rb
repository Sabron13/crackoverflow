class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @question_or_answer = Post.find(params[:post_id])
  end

  def create

    post = Post.find(params[:post_id])

    if current_user
      comment = Comment.create(content: params[:comment][:content], user_id: current_user.id, post: post)

      if request.xhr?
        render partial: 'show', locals: {comment: comment}
      else
        if post.question_id
          redirect_to question_path(post.question)
        else
          redirect_to question_path(post)
        end
      end
    else
      set_flash('You must be logged in')
      redirect_to new_sessions_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end

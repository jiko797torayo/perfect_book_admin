class BooksController < ApplicationController
  protect_from_forgery except: [:destroy]
  before_action :set_book, only: [:show, :destroy]
  around_action :action_logger, only: [:destroy]
  skip_before_action :require_login, only: [:new, :create]

  # このようにも書ける
  # before_action do
  #   redirect_to access_denied_path if params[:token].blank?
  # end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def action_logger
    logger.info "around-before"
    yield
    logger.info "aroung-after"
  end
end

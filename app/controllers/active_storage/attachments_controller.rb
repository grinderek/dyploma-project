class ActiveStorage::AttachmentsController < ApplicationController
  before_action :set_attachment, :authorize_attachment_parent!

  def destroy
    @attachment.purge_later
  end

  private

  def set_attachment
    @attachment = ActiveStorage::Attachment.find(params[:id])
    @record = @attachment.record
  end

  def authorize_attachment_parent!
    #authorize! :manage, @record
  end
end
# frozen_string_literal: true

module ActiveStorage
  class AttachmentsController < ApplicationController
    before_action :set_attachment

    def destroy
      @attachment.purge_later
    end

    private

    def set_attachment
      @attachment = ActiveStorage::Attachment.find(params[:id])
      @record = @attachment.record
    end
  end
end

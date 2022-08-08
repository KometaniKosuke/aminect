class AutomailsController < ApplicationController
  before_action :set_automail, only: %i[ show edit update destroy ]

  # GET /automails or /automails.json
  def index
    @automails = Automail.all
  end

  # GET /automails/1 or /automails/1.json
  def show
  end

  # GET /automails/new
  def new
    @automail = Automail.new
  end

  # GET /automails/1/edit
  def edit
  end

  # POST /automails or /automails.json
  def create
    @automail = Automail.new(automail_params)

    respond_to do |format|
      if @automail.save
        SendMailer.with(user: @automail).published_email.deliver_later # 追記
        # SendMailer.published_email(@automail).deliver #こちらを追加する。
        format.html { redirect_to automail_url(@automail), notice: "Automail was successfully created." }
        format.json { render :show, status: :created, location: @automail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @automail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /automails/1 or /automails/1.json
  def update
    respond_to do |format|
      if @automail.update(automail_params)
        format.html { redirect_to automail_url(@automail), notice: "Automail was successfully updated." }
        format.json { render :show, status: :ok, location: @automail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @automail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /automails/1 or /automails/1.json
  def destroy
    @automail.destroy

    respond_to do |format|
      format.html { redirect_to automails_url, notice: "Automail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_automail
      @automail = Automail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def automail_params
      params.require(:automail).permit(:name, :email)
    end
end

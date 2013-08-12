require 'spec_helper'

describe TodosController do
  it "displays an error for a missiong todo" do
    get :show, :id => "not-here"
    expect(response).to redirect_to(todos_path)
    message = "The todo you are looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end
end

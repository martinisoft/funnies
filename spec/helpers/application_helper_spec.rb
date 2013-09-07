require 'spec_helper'

describe ApplicationHelper do
  describe '.flash_messages' do
    context 'when there are no messages' do
      it 'returns nothing' do
        expect(helper.flash_messages).to be_nil
      end
    end

    context 'when there is a notice message' do
      let(:message) { "Success!" }

      before { flash[:notice] = message }

      it 'returns a div with alert-box and success classes and a close link' do
        result = "<div class=\"alert-box success\" data-alert=\"\">#{message}<a class=\"close\" href=\"#\">x</a></div>"
        expect(helper.flash_messages).to eq result
      end
    end

    context 'when there is an error message' do
      let(:message) { "Fail!" }

      before { flash[:alert] = message }

      it 'returns a div with notice and alert classes' do
        result = "<div class=\"alert-box alert\" data-alert=\"\">#{message}<a class=\"close\" href=\"#\">x</a></div>"
        expect(helper.flash_messages).to eq result
      end
    end
  end
end

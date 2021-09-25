require 'rails_helper'

RSpec.describe BackgroundsFacade do
  it 'can return json', :vcr do
    location = 'denver, co'
    expected = "{:data=>{:id=>nil, :type=>\"image\", :attributes=>{:image=>{:location=>\"denver, co\", :image_url=>\"https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjI5OTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MzI1NDE3MzQ&ixlib=rb-1.2.1&q=80&w=1080\", :credit=>{:source=>\"unsplash.com\", :author=>\"Ryan De Hamer\", :logo=>\"https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg\"}}}}}"

    x = BackgroundsFacade.fetch_image(location).to_s

    expect(x).to eq(expected)
  end
end

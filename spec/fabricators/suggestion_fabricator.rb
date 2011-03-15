Fabricator(:suggestion) do
  user      { Fabricate(:user) }
  name      "Dominic Deegan"
  website   "http://www.dominic-deegan.com/"
  reason    "It's an awesome comic"
end

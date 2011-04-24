Fabricator(:post) do
  title "Oh my god its a blog post!"
  body "And it has very little content"
  user! { |post| Fabricate :admin }
end

unless Rails.env.production?
    Comment.delete_all
    User.delete_all

    user1 = User.new
    user1.name = 'glauton'
    user1.password = 'test123'
    user1.password_confirmation = 'test123'
    user1.save!

    puts 'User glauton with password test123 created'

    user2 = User.new
    user2.name = 'natasha'
    user2.password = 'test1234'
    user2.password_confirmation = 'test1234'
    user2.save!

    puts 'User natasha with password test1234 created'

    Comment.create(
        [
            {
                content: 'I love pizza',
                user: user1
            },
            {
                content: "But I am on a diet, so I can't eat pizza",
                user: user1
            },
            {
                content: 'I love drawing',
                user: user2
            },
            {
                content: "But but my sheets are gone, so I can't draw",
                user: user2
            }
        ]
    )

    puts 'Four comments were created'
end
class UserSerializer
  def self.user(user_data)
    {data:
      { id: user_data[:id],
        type: 'user',
        attributes: {
          email: user_data[:email],
          api_key: 'example'
        }
      }
    }
  end
end

class SessionSerializer

  def self.session(user_data)
    {data:
      { id: user_data[:id],
        type: 'users',
        attributes: {
          email: user_data[:email],
          api_key: user_data[:api_key]
        }
      }
    }
  end
end

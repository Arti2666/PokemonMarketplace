module UsernameHelper
  def check_pseudo(pokemon, users)
    users.find(pokemon.user_id).username.present? ? users.find(pokemon.user_id).username : users.find(pokemon.user_id).email
  end

  def check_username_empty(user)
    user.username.present? ? user.username : user.email
  end
end

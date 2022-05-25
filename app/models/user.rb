class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 2..20 }
  validates :email, presence: true
  validates :phone, presence: true

  # postgresの時は::textを入れる？？
  scope :search_information, -> (keyword) {
    where('name::text LIKE :keyword OR id::text LIKE :keyword OR email::text LIKE :keyword OR phone::text LIKE :keyword', keyword: "%#{keyword}%")
  }

  def update_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  #User退会機能
  #与えられた引数によってtrueまたはfalseを返す
  def switch_flg(withdrawal)
    withdrawal ? false : true
  end

end

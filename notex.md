manufact
has many products

user
has many reviews
has mnay products through reviews

review
belongs to user
belongs to product

product
belongs to manufact
has many reviews
has mnay users through reviews

no edit for product
review join table

t.references :user, null: false, foreign_key: true
class AddManufacturerToUser < ActiveRecord::Migration[6.0]
def change
add_column :users, :manufacturer, :boolean, default: false
end
end

<% if @user.manufacturer? %>
<%= @user.approved_on %>
<% else %>
Not yet approved. (<%= link_to "Approve", manufacturer_user_path(@user), :method => :put %>)
<% end %>

    <%= f.submit "Save changes", class: "btn btn-large btn-primary" %>
    <% end %>

connorworthen
connor22

testaccount
test123

def update
user_helper # if @user.update_attributes(params[:user])
if @user.update_attribute(:manufacturer, 'true') # if @user.save
redirect_to users_path(@user)
else
render :edit
end
end

ActiveAdmin.register Cat do

  permit_params :name, :color, :picture, :race, :gender

    # this index call specifies which properties will be visible in the listing of all Cats within admin
  index do
    column :name
    column :race
    column :picture
    column :created_at
    actions
  end
  
  # this should customize the layout for a single-cat page
  show do |cat|
    attributes_table do
      row :id
      row :name
      row :color
      row :race
      row :gender
      row :picture do
        link_to(cat.picture.url, cat.picture.url)
      end
      row :picture do
        image_tag(cat.picture.url(:thumb))
      end
    end
  end

  form :html => {:enctype => "multipart/form-data"} do |f|
    f.inputs "Details" do
      f.input :name
      f.input :color
      f.input :race
      f.input :gender
    end   
    f.inputs "Pictures" do
      f.input :picture, :label => 'Cat Picture', :as => :file
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end

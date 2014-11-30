ActiveAdmin.register Cat do
  menu :priority => 1

  permit_params :name, :colour, :picture, :race, :gender

    # this index call specifies which properties will be visible in the listing of all Cats within admin
  index do
    table_for Cat.order("name asc") do
      column("Name"){|cat| link_to(cat.name, admin_cat_path(cat)) }
      column("Color"){|cat| cat.colour}
      column("Picture"){|cat| image_tag(cat.picture.url(:thumb))}
      column :race
	  column :gender
      actions
    end
  end
  
  # this should customize the layout for a single-cat page
  show do |cat|
    attributes_table do
      row :id
      row :name
      row :colour
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
      f.input :colour, :label => 'Color'
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

ActiveAdmin.register Game do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :name,
                game_categories_attributes: [:id, :game_id, :category_id, :_destroy],
                game_radioactors_attributes: [:id, :game_id, :radioactor_id, :_destroy]

  form do |f|
    f.inputs 'ゲーム登録' do
      f.input :name
      f.has_many :game_categories, allow_destroy: true, heading: false,
      new_record: true do |ab|
        ab.input  :category_id,
                  label: 'カテゴリ',
                  as: :select,
                  collection: Category.all.map { |a| [a.name, a.id] }
      end
      f.has_many :game_radioactors, allow_destroy: true, heading: false,
      new_record: true do |ab|
        ab.input  :radioactor_id,
                  label: '声優',
                  as: :select,
                  collection: Radioactor.all.map { |a| [a.name, a.id] }
      end
      f.actions
    end
  end
end

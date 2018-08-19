ActiveAdmin.register Gameasp do
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

permit_params :appid,:name,:identifier,:price,:url,:api,:platform,:game_id

# active_admin_import validate: true, batch_transaction: true, template_object: ActiveAdminImport::Model.new(
#    hint: "インポートするCSVファイルにヘッダー行は必要ありません。<br>
#    文字コードは CP932(Windows-31J) を想定しています。(Excelを元にしたCSVファイルを想定)<br>
#    <br>
#    以下の順序で設定されているファイルを取り込みます:<br>
#    'ID', 'パスワード', '姓', '名', '所属'<br>
#    <br>
#    取込に失敗した場合のエラーは5件分のみ表示しています。",
#    csv_headers: ['appid', 'name', 'identifier', 'price', 'url', 'api', 'platform'],
#    force_encoding: :'CP932'
# )

end

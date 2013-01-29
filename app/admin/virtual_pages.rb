ActiveAdmin.register VirtualPage do
  actions :index, :edit, :update

  form partial: 'form'
end

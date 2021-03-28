class TaskReflex < StimulusReflex::Reflex
  def toggle
    # reflex receives html element from data-reflex
    # you have access to element's properties like dataset attrs
    # set in html, eg: data-id="10" gives element.dataset.id => "10"
    Task.find(element.dataset.id).update(completed_at: element.checked ? Time.current : nil)
  end

  def destroy
    Task.find(element.dataset.id).destroy!
  end

  def create
    list = List.find(element.dataset.list_id)
    list.tasks.create(task_params)
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end

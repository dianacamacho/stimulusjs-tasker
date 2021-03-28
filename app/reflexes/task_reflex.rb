class TaskReflex < StimulusReflex::Reflex
  def toggle
    # reflex receives html element from data-reflex
    # you have access to element's properties like dataset attrs
    # set in html, eg: data-id="10" gives element.dataset.id => "10"
    Task.find(element.dataset.id).update(completed_at: element.checked ? Time.current : nil)
  end
end

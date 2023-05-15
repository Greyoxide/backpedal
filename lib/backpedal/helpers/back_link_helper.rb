module BackLinkHelper
  def back_link(path = nil)
    if path.present?
      link_to path, class: 'back_link' do
        concat content_tag :i, '', class: 'fas fa-chevron-left'
        concat t('backpedal.back')
      end

    elsif session[:tree].present?
      last = session[:tree].split(',').last
      link_to last, class: 'back_link' do
        concat content_tag :i, '', class: 'fas fa-chevron-left'
        concat t('backpedal.back')
      end
    end
  end
end

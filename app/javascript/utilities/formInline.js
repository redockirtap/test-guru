document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInlineLinkHandler)
  $('.edit-pencil').on('mouseenter', showEditPencil)
  $('.edit-pencil').on('mouseleave', hideEditPencil)

  let errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function showEditPencil(e) {
  let pencil = this.children[0].querySelector('.form-inline-link')
  pencil.classList.remove('hide')
}

function hideEditPencil(e) {
  let pencil = this.children[0].querySelector('.form-inline-link')
  pencil.classList.add('hide')
}

function formInlineLinkHandler(event) {
  event.preventDefault()

  let testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  let link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  let $testTitle = $(`.test-title[data-test-id="${testId}"]`)
  let $formInline = $(`.form-inline[data-test-id="${testId}"]`)

  $testTitle.toggle()
  $formInline.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Edit'
  }
}
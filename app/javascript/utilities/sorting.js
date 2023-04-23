document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')
  
  if (control) control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle () {
  let table = document.querySelector('table')

  let rows = table.querySelectorAll('tr')
  let sortedRows = Array.from(rows)
  sortedRows.shift()


  if (this.querySelector('.octicon-arrow-up').classList.contains('arrow-active')) {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.remove('arrow-active')
    this.querySelector('.octicon-arrow-down').classList.add('arrow-active')
  } else if (this.querySelector('.octicon-arrow-down').classList.contains('arrow-active')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.add('arrow-active')
    this.querySelector('.octicon-arrow-down').classList.remove('arrow-active')
  } else {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-down').classList.remove('arrow-active')
    this.querySelector('.octicon-arrow-up').classList.add('arrow-active')
  }

  let sortedTable = document.createElement('table')
  let tableBody = document.createElement('tbody')

  sortedTable.appendChild(tableBody)
  tableBody.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++) {
    tableBody.appendChild(sortedRows[i])
  }

  table.replaceWith(sortedTable)
  sortedTable.classList.add('table', 'table-light', 'table-hover', 'table-bordered', 'mt-2')
}

function compareRowsDesc(row1, row2) {
let testTitle1 = row1.querySelector('td').textContent
let testTitle2 = row2.querySelector('td').textContent

if (testTitle1 < testTitle2) { return 1 }
if (testTitle1 > testTitle2) { return -1 }
return 0
}

function compareRowsAsc(row1, row2) {
let testTitle1 = row1.querySelector('td').textContent
let testTitle2 = row2.querySelector('td').textContent

if (testTitle1 < testTitle2) { return -1 }
if (testTitle1 > testTitle2) { return 1 }
return 0
}

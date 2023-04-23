document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')
  
  if (control) control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle () {
  let table = document.querySelector('table')

  let rows = table.querySelectorAll('tr')
  let sortedRows = Array.from(rows)
  sortedRows.shift()


  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  let sortedTable = document.createElement('table')
  sortedTable.classList.add('table', 'table-light', 'table-hover', 'table-bordered', 'mt-2')


  sortedTable.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.replaceWith(sortedTable)
}

function compareRowsAsc(row1, row2) {
let testTitle1 = row1.querySelector('td').textContent
let testTitle2 = row2.querySelector('td').textContent

console.log(testTitle1, testTitle2)

if (testTitle1 < testTitle2) { return 1 }
if (testTitle1 > testTitle2) { return -1 }
return 0
}

function compareRowsDesc(row1, row2) {
let testTitle1 = row1.querySelector('td').textContent
let testTitle2 = row2.querySelector('td').textContent

if (testTitle1 < testTitle2) { return -1 }
if (testTitle1 > testTitle2) { return 1 }
return 0
}

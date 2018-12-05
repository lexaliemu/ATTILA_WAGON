import instantsearch from 'instantsearch.js';
import { searchBox, hits } from 'instantsearch.js/es/widgets';


// 1. Instantiate the search

const searchForm = document.getElementById('search');
const search = instantsearch({
  appId: searchForm.dataset.algoliaAppId,
  apiKey: searchForm.dataset.algoliaApiKey,
  indexName: 'User',
});
console.log(search)

// 2. Create an interactive search box
search.addWidget(
  searchBox({
    container: document.querySelector('#search-input'),
    placeholder: 'Search'
  })
);

// 3. Plug the search results into the product container
search.addWidget(
  hits({
    container: document.querySelector('#results'),
    templates: {
      item: '{{{_highlightResult.username.value}}}',
    },
  })
);
// 4. Make the brands refinable
// search.addWidget(
//   instantsearch.widgets.refinementList({
//     container: document.querySelector('#brand'),
//     attributeName: 'brand',
//   })
// );
console.log(search)
// 5. Start the search!
search.start();

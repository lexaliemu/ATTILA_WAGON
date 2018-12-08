import instantsearch from 'instantsearch.js';
import { searchBox, hits } from 'instantsearch.js/es/widgets';

// 1. Instantiate the search

const searchForm = document.getElementById('search');
const search = instantsearch({
  appId: searchForm.dataset.algoliaAppId,
  apiKey: searchForm.dataset.algoliaApiKey,
  indexName: 'Movie',
  searchParameters: {
    hitsPerPage: 5
  }
});

const searchUser = instantsearch({
  appId: searchForm.dataset.algoliaAppId,
  apiKey: searchForm.dataset.algoliaApiKey,
  indexName: 'User',
  searchParameters: {
    hitsPerPage: 5
  }
});

const searchPlaylist = instantsearch({
  appId: searchForm.dataset.algoliaAppId,
  apiKey: searchForm.dataset.algoliaApiKey,
  indexName: 'Playlist',
  searchParameters: {
    hitsPerPage: 5
  }
});

// 2. Create an interactive search box
search.addWidget(
  searchBox({
    container: document.querySelector('#search-input'),
    placeholder: 'Search'
  })
);

searchUser.addWidget(
  searchBox({
    container: document.querySelector('#search-input'),
    placeholder: 'Search'
  })
);

searchPlaylist.addWidget(
  searchBox({
    container: document.querySelector('#search-input'),
    placeholder: 'Search'
  })
);

// 3. Plug the search results into the product container
search.addWidget(
  hits({
    container: document.querySelector('#resultsMovie'),
    templates: {
    item: `
            <div class="card-movie">
              <div class="poster-movie">
                <img class ="img-movie" src="{{{_highlightResult.poster_url.value}}}">
              </div>
              <div class="title-movie">
                <p>{{{_highlightResult.title.value}}}</p>
              </div>
              <a href="/movies/{{id}}" class="resultsalgolia"></a>
            </div>`,
    },
  })
);

searchUser.addWidget(
  hits({
    container: document.querySelector('#resultsUser'),
    templates: {
    item: `
            <div class="card-movie">
              <div class="poster-user">
                <img class ="img-user" src="{{avatar_url}}" height="180" width="180">
              </div>
              <div class="user-name">
                <p>{{{_highlightResult.username.value}}}</p>
              </div>
              <a href="/users/{{id}}" class="resultsalgolia"></a>
            </div>`,
    },
  })
);

searchPlaylist.addWidget(
  hits({
    container: document.querySelector('#resultsPlaylist'),
    templates: {
    item: `
          <div class="card-movie">
              <div class="poster-movie">
                <img class ="img-movie" src="{{picture_url}}" height="180" width="180">
              </div>
              <div class="user-name">
                <p>{{name}}</p>
              </div>
              <a href="/playlists/{{id}}" class="resultsalgolia"></a>
            </div>`,
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

// 5. Start the search!
search.start();
searchUser.start();
searchPlaylist.start();


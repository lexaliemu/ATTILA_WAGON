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
    item: `<a href="/movies/{{id}}" id="resultsalgolia">
            <div class="card-movie"
              <div class="poster-movie">
                <img id ="img-movie" src="{{{_highlightResult.poster_url.value}}}">
              </div>
              <div class="title-movie">
                <p>{{{_highlightResult.title.value}}}</p>
              </div>
            </div>
          </a>`,
    },
  })
);

searchUser.addWidget(
  hits({
    container: document.querySelector('#resultsUser'),
    templates: {
    item: `<a href="#" id="resultsalgolia">
            <div class="card-movie"
              <div class="poster-movie">
                <img id ="img-avatar" src="https://res.cloudinary.com/dvtjorjay/image/upload/v1543583375/ebkcnta4laj9tp88dcvq.jpg">
              </div>
              <div class="title-movie">
                <p>{{{_highlightResult.username.value}}}</p>
              </div>
            </div>
          </a>`,
    },
  })
);

searchPlaylist.addWidget(
  hits({
    container: document.querySelector('#resultsPlaylist'),
    templates: {
    item: `<a href="/playlists/{{id}}" id="resultsalgolia">
            <div class="card-movie"
              <div class="poster-movie">
                <img id ="img-movie" src="http://www.yvelinesradio.com/infos_all/photos/2011/Logo-2-Playlist-04-12-2011-21h52-05-La-premeire-de-Playlist.jpg">
              </div>
              <div class="title-movie">
                <p href="/playlists/{{id}}">{{{_highlightResult.name.value}}}</p>
              </div>
            </div>
          </a>`,
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


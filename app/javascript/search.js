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
    // item: `<div class="resultMovie d-inline-block">
    //          <img src="{{{_highlightResult.poster_url.value}}}" height="60" width="60">
    //          <a href="/movies/{{id}}" class="btn btn-primary">{{{_highlightResult.title.value}}}</a>
    //        </div>`,
    item: `<div class="card-movie"
            <div class="poster-movie">
              <img id ="img-movie" src="{{{_highlightResult.poster_url.value}}}">
            </div>
            <div class="title-movie">
              <a href="/movies/{{id}}">{{{_highlightResult.title.value}}}</a>
            </div>
          </div>`,
    },
  })
);

searchUser.addWidget(
  hits({
    container: document.querySelector('#resultsUser'),
    templates: {
    // item: `<div class="resultUser d-inline-block">
    //         <img src="https://res.cloudinary.com/dvtjorjay/image/upload/v1543583375/ebkcnta4laj9tp88dcvq.jpg" height="60" width="60">
    //         <a href="/movies/{{id}}" class="btn btn-primary">{{{_highlightResult.username.value}}}</a>
    //        </div>`,
    item: `<div class="card-movie"
              <div class="poster-movie">
                <img id ="img-avatar" src="https://res.cloudinary.com/dvtjorjay/image/upload/v1543583375/ebkcnta4laj9tp88dcvq.jpg">
              </div>
              <div class="title-movie">
                <a href="#">{{{_highlightResult.username.value}}}</a>
              </div>
          </div>`,
    },
  })
);

searchPlaylist.addWidget(
  hits({
    container: document.querySelector('#resultsPlaylist'),
    templates: {
    // item: `<div class="resultUser d-inline-block">
    //         <img src="http://www.yvelinesradio.com/infos_all/photos/2011/Logo-2-Playlist-04-12-2011-21h52-05-La-premeire-de-Playlist.jpg" height="60" width="60">
    //         <a href="/playlist/{{id}}" class="btn btn-primary">{{{_highlightResult.name.value}}}</a>
    //        </div>`,
    item: `<div class="card-movie"
            <div class="poster-movie">
              <img id ="img-movie" src="http://www.yvelinesradio.com/infos_all/photos/2011/Logo-2-Playlist-04-12-2011-21h52-05-La-premeire-de-Playlist.jpg">
            </div>
            <div class="title-movie">
              <a href="/playlists/{{id}}">{{{_highlightResult.name.value}}}</a>
            </div>
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


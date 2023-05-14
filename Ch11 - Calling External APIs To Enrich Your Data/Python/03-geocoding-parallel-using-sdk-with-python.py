# THIS SCRIPT IS SUPPOSED TO RUN IN A JUPYTER NOTEBOOK (WE USED VS CODE)

# %%
import os
import geocoder
import dask.dataframe as dd
import time


# %%
def bing_geocode_via_address(address):
    r = geocoder.bing(address, key = AUTH_KEY)
    
    return r.address, r.lat, r.lng, r.json, r.status, r.url


def enrich_with_geocoding(passed_row, col_name):

    address_value = str(passed_row[col_name])
    
    address_formatted, address_lat, address_lng, text, status, url = bing_geocode_via_address(address_value)
    
    passed_row_copy = passed_row.copy()

    passed_row_copy['formattedAddress'] = address_formatted
    passed_row_copy['latitude'] = address_lat
    passed_row_copy['longitude'] = address_lng
    passed_row_copy['text'] = text
    passed_row_copy['status'] = status
    passed_row_copy['url'] = url
    
    return passed_row_copy


# %%
####################################################################################################
# To be set up separately for security reasons
####################################################################################################
os.environ['BINGMAPS_API_KEY'] = '<your-api-key>'
####################################################################################################

# %%
AUTH_KEY = os.environ.get('BINGMAPS_API_KEY')

# %%
ddf_orig = dd.read_csv(r'D:\<your-path>\Ch11 - Calling External APIs To Enrich Your Data\geocoding_test_data.csv',
                       encoding='latin-1')

ddf = ddf_orig[['full_address']]

ddf = ddf.repartition(npartitions=os.cpu_count()*2)
# %%
enriched_ddf = ddf.apply(enrich_with_geocoding, axis=1, col_name='full_address',
                         meta={'full_address': 'string', 'formattedAddress': 'string',
                               'latitude': 'float64', 'longitude': 'float64', 'text': 'string',
                               'status': 'string', 'url': 'string'})

# %%
tic = time.perf_counter()

enriched_df = enriched_ddf.compute()

toc = time.perf_counter()

print(f'{enriched_df.shape[0]} addresses geocoded in {toc - tic:0.4f} seconds')

# %%
enriched_df

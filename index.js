import { handleHttp, handleCloudEvent } from './output/Main/index.js';
import functions from '@google-cloud/functions-framework'



functions.cloudEvent('testEvent', _ => console.log('hello from cloudEvent'));
functions.http('testHttp', (req,res) => console.log('hello from http'))



handleHttp()
handleCloudEvent()



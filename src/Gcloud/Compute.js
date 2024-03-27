import compute from '@google-cloud/compute';

export const instancesClient_ = () => new compute.InstancesClient();

export const gcpInstances_ = client => request => () =>
  client.list(request)
    .then(response => {
      const result = response[0];
      if (Array.isArray(result) && result.length > 0)
        return result;
      else
        return [];
    })




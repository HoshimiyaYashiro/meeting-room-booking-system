import { CollectionConfig } from 'payload/types'

const Branches: CollectionConfig = {
  slug: 'branches',
  admin: {
    useAsTitle: 'name',
  },
  fields: [
    {
      name: 'name',
      type: 'text',
    },
    {
      name: 'description',
      type: 'textarea',
    },
    {
      name: 'address',
      type: 'textarea',
    },

  ]
}

export default Branches

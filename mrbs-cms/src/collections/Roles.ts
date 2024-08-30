import { CollectionConfig } from 'payload/types'

const Roles: CollectionConfig = {
  slug: 'roles',
  admin: {
    useAsTitle: 'name',
  },
  fields: [
    {
      name: 'code',
      type: 'text',
    },
    {
      name: 'name',
      type: 'text',
    },
    {
      name: 'description',
      type: 'text',
    },
  ]
}

export default Roles

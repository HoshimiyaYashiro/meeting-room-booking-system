import { CollectionConfig } from 'payload/types'
import Branches from '../Branches'

const Rooms: CollectionConfig = {
  slug: 'rooms',
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
      name: 'branch',
      type: 'relationship',
      relationTo: Branches.slug,
      required: true,
    },
    {
      name: 'location',
      type: 'text',
    },
    {
      name: 'capacity',
      type: 'number',
    },
    {
      name: 'equipment',
      type: 'json',
    }
  ]
}

export default Rooms

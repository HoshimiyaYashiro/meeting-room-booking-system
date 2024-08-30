import { CollectionConfig } from 'payload/types'

const MeetingRooms: CollectionConfig = {
  slug: 'meeting-rooms',
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
      type: 'text',
    },
  ]
}

export default MeetingRooms

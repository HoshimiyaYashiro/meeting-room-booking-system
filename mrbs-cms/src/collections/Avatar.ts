import path from 'path'
import type { CollectionConfig } from 'payload/types'
import { isAnyOne } from '../access/isAnyOne'

const Avatar: CollectionConfig = {
  slug: 'avatar',
  upload: {
    staticDir: process.env.UPLOAD_DIR ?? path.resolve(__dirname, '../../uploads/avatar'),
  },
  access: {
    read: isAnyOne,
  },
  fields: [
    {
      name: 'alt',
      type: 'text',
      required: true,
    },
    {
      name: 'description',
      type: 'textarea',
    },
  ]
}

export default Avatar